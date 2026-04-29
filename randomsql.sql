--Updating user's group membership

update public.user_group_membership
set membership_type = 'UNMANAGED', group_id = '<GROUP_ID>'
where user_id = '<USER_ID>';

select * from public.user_group_membership
where user_id = '<USER_ID>';