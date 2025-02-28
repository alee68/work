import boto3
from botocore.exceptions import ClientError

def resource_exists(resource):
    """
    Checks if an AWS resource exists based on its service, type, and identifier.
    
    Parameters:
        resource (dict): A dictionary with keys 'service', 'type', and 'id'.
    
    Returns:
        bool: True if the resource exists, False otherwise.
    """
    service = resource.get('service')
    resource_type = resource.get('type')
    resource_id = resource.get('id')
    
    try:
        if service == 's3' and resource_type == 'bucket':
            s3 = boto3.client('s3')
            # head_bucket will succeed if the bucket exists (and you have permission)
            s3.head_bucket(Bucket=resource_id)
        
        elif service == 'ec2':
            ec2 = boto3.client('ec2')
            if resource_type == 'instance':
                response = ec2.describe_instances(InstanceIds=[resource_id])
                # Check if Reservations/Instances are present
                if not response.get('Reservations') or not response['Reservations'][0].get('Instances'):
                    return False
            elif resource_type == 'volume':
                response = ec2.describe_volumes(VolumeIds=[resource_id])
                if not response.get('Volumes'):
                    return False
        
        elif service == 'rds':
            rds = boto3.client('rds')
            if resource_type == 'instance':
                # If the DB instance doesn't exist, this will raise an exception.
                rds.describe_db_instances(DBInstanceIdentifier=resource_id)
            elif resource_type == 'cluster':
                rds.describe_db_clusters(DBClusterIdentifier=resource_id)
        
        else:
            print(f"Unsupported resource type: service={service}, type={resource_type}")
            return False
        
        # If no exception is raised, the resource exists.
        return True

    except ClientError as e:
        error_code = e.response.get("Error", {}).get("Code")
        # Known error codes for a non-existent resource
        not_found_codes = {
            's3': ['404', 'NoSuchBucket'],
            'ec2_instance': ['InvalidInstanceID.NotFound'],
            'ec2_volume': ['InvalidVolume.NotFound'],
            'rds_instance': ['DBInstanceNotFound'],
            'rds_cluster': ['DBClusterNotFound']
        }
        
        if service == 's3' and error_code in not_found_codes['s3']:
            return False
        elif service == 'ec2':
            if resource_type == 'instance' and error_code in not_found_codes['ec2_instance']:
                return False
            elif resource_type == 'volume' and error_code in not_found_codes['ec2_volume']:
                return False
        elif service == 'rds':
            if resource_type == 'instance' and error_code in not_found_codes['rds_instance']:
                return False
            elif resource_type == 'cluster' and error_code in not_found_codes['rds_cluster']:
                return False

        # For any other ClientError, print the error and return False.
        print(f"Error checking {resource}: {e}")
        return False

# Example usage:
resources = [
    {"service": "s3", "type": "bucket", "id": "my-bucket"},
    {"service": "ec2", "type": "instance", "id": "i-xxxxxxxxxxxxxx"},
    {"service": "ec2", "type": "volume", "id": "vol-xxxxxxxxxxxxxx"},
    {"service": "rds", "type": "instance", "id": "my-rds-instance"},
    {"service": "rds", "type": "cluster", "id": "my-rds-cluster"}
]

for res in resources:
    exists = resource_exists(res)
    print(f"Resource {res['id']} exists: {exists}")
