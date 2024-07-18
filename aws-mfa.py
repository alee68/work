#!/usr/bin/env python3

import argparse
import boto3
import logging
from getpass import getpass
from subprocess import call

AUTHOR = "anon"
VERSION = "1.0.0"

def aws_mfa(profile):
    aws_session = boto3.session.Session(profile_name=profile)
    src_profile = aws_session.profile_name
    logging.info("Set `%s` as source profile", src_profile)

    if src_profile == "default":
        mfa_profile = "mfa"
    else:
        mfa_profile = src_profile + "-mfa"
    logging.info("Set `%s` as MFA profile", mfa_profile)

    if aws_session.region_name:
        src_region = aws_session.region_name
        logging.info("Set `%s` as source region", src_region)
    else:
        src_region = None
        logging.info("Region not specified")

    mfa_serial_number = get_mfa_serial_number(aws_session)
    logging.info("Set `%s` as MFA serial number", mfa_serial_number)

    mfa_token_code = getpass("Enter MFA token code for the '{}' profile: ".format(src_profile))

    if not mfa_token_code:
        print("Aborted!")
        return

    mfa_session_creds = get_mfa_session_creds(
        aws_session=aws_session,
        mfa_serial_number=mfa_serial_number,
        mfa_token_code=mfa_token_code,
    )
    logging.info(
        "Set `%s` as Access Key ID for MFA-authenticated session",
        mfa_session_creds["AccessKeyId"],
    )

    update_aws_config(
        mfa_session_creds=mfa_session_creds,
        mfa_profile=mfa_profile,
        mfa_region=src_region,
    )

    print(
        "Success! Make MFA-authenticated API calls using --profile {}. Expires in 12 hours.".format(
            mfa_profile
        )
    )

def get_mfa_serial_number(aws_session):
    iam = aws_session.client("iam")
    res = iam.list_mfa_devices()

    if not res["MFADevices"]:
        raise Exception(
            "The IAM User associated with the '{}' profile doesn't have an MFA device".format(
                aws_session.profile_name
            )
        )

    if len(res["MFADevices"]) > 1:
        raise Exception(
            "The IAM User associated with the '{}' profile has multiple MFA devices".format(
                aws_session.profile_name
            )
        )

    return res["MFADevices"][0]["SerialNumber"]

def get_mfa_session_creds(aws_session, mfa_serial_number, mfa_token_code):
    sts = aws_session.client("sts")
    return sts.get_session_token(
        DurationSeconds=43200,  # 12 hours
        SerialNumber=mfa_serial_number,
        TokenCode=mfa_token_code,
    )["Credentials"]

def set_config_val(key, val, mfa_profile):
    # TODO: Can this be done with boto3 instead of using call?
    call(["aws", "configure", "set", key, val, "-profile", mfa_profile])

def update_aws_config(mfa_session_creds, mfa_profile, mfa_region):
    set_config_val(
        "aws_access_key_id",
        mfa_session_creds["AccessKeyId"],
        mfa_profile,
    )
    set_config_val(
        "aws_secret_access_key",
        mfa_session_creds["SecretAccessKey"],
        mfa_profile,
    )
    set_config_val(
        "aws_session_token",
        mfa_session_creds["SessionToken"],
        mfa_profile,
    )
    if mfa_region:
        set_config_val("region", mfa_region, mfa_profile)

def main():
    arg_parser = argparse.ArgumentParser(
        description=(
            "Generate temporary, MFA-authenticated session credentials from an"
            "existing profile containing IAM user access keys. Create a new"
            "profile with these creds for the AWS CLI & SDKs. Creds expire"
            "after 12 hours. For assistance, contact {}.".format(AUTHOR)
        )
    )

    arg_parser.add_argument(
        "-profile", help="existing profile containing IAM user access keys"
    )
    arg_parser.add_argument(
        "-v", "-verbose", help="output extra info", action="store_true"
    )
    arg_parser.add_argument("-version", action="version", version=VERSION)
    args = arg_parser.parse_args()

    if args.profile and args.profile.endswith("-mfa"):
        raise Exception("Profile can't end with '-mfa'.")

    if args.verbose:
        logging.basicConfig(level=logging.INFO)

    aws_mfa(args.profile)

if __name__ == "__main__":
    main()