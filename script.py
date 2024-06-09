import boto3
import base64

# Initialize the Lightsail client
client = boto3.client('lightsail', region_name='ap-south-1')

# Read and encode the launch script
with open('launch-script.sh', 'rb') as file:
    user_data = base64.b64encode(file.read()).decode('utf-8')

# Create a Lightsail instance
response = client.create_instances(
    instanceNames=['saad-lightsail-instance'],
    availabilityZone='ap-south-1a',
    blueprintId='amazon_linux_2',  # Specify the instance OS
    bundleId='micro_3_1',  # Specify the instance plan
    userData=user_data,
)

# Print the response
print(response)
