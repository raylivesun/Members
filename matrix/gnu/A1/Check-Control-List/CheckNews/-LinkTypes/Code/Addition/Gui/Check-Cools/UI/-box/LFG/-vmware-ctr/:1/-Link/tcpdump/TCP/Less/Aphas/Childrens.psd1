#!/home/admin/app/PowerShell/Members

# Alphas Childrens Mchines (ACH)
$ach_machines = 
    'ach-mch-01',
    'ach-mch-02',
    'ach-mch-03'
    # Add more machines here


# Check the status of each machine
for (machine in $ach_machines) {
    output = !aws ec2 describe-instances --instance-ids $machine --query 'Reservations[*].Instances[*].{State:State.Name, PublicIP:PublicIpAddress}'
    Write-Output "Machine: $machine, State: ${output[0]}, Public IP: ${output[1]}"
    Write-Output ""
    sleep 10
}


# Amazon Elastic Compute Cloud (EC2)
$ec2_instances = 
    'i-0123456789abcdef0',
    'i-0bcdefghijklmnop',
    'i-1234567890abcdef'
    # Add more instances here


# Check the status of each instance
for (instance in $ec2_instances) {
    output = !aws ec2 describe-instances --instance-ids $instance --query 'Reservations[*].Instances[*].{State:State.Name, PublicIP:PublicIpAddress}'
    Write-Output "Instance: $instance, State: ${output[0]}, Public IP: ${output[1]}"
    Write-Output ""
    sleep 10
}


# Amazon Relational Database Service (RDS)
$rds_instances = 
    'db-abcdef1234567890',
    'db-bcdefghijklmnopq',
    'db-cdefghijklmnop'
    # Add more instances here


# Check the status of each instance
for (instance in $rds_instances) {
    output = !aws rds describe-db-instances --db-instance-identifier $instance --query 'DBInstances[*].{State:DBInstanceStatus, Endpoint:Endpoint.Address}'
    Write-Output "RDS Instance: $instance, State: ${output[0]}, Endpoint: ${output[1]}"
    Write-Output ""
    sleep 10
}



