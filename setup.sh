#!/bin/sh
#Ask for DB information:
echo "Enter database address:"
read -s adr

echo "Enter database name:"
read -s dbname

echo "Enter username:"
read -s username

echo -n "Enter password:"
read -s password


#if one of the fields is empty, throw an error message and return:
if [[ -z "$adr" || -z "$dbname" || -z "$username" || -z "$password" ]]
then 
		echo "one of the required field is empty!"
			exit
fi

#build docker image:

echo "Step 2: Build docker image \n"
docker build . -t genomeflow_runner --build-arg db_address_build=$adr \
	       			     --build-arg db_name_build=$dbname \
				     		             --build-arg db_username_build=$username \
							     			     --build-arg db_password_build=$password 

#PUSH TO THE REGISTRY: 
echo "Step 3: Tag image\n"
docker tag genomeflow_runner us-east1-docker.pkg.dev/hoang-test-338616/genomeflow/genomeflow_runner 
echo "Step 4: Push image to gcr.io:\n"
docker push us-east1-docker.pkg.dev/hoang-test-338616/genomeflow/genomeflow_runner 

