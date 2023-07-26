# docker-compose-auto-update

## Description

docker-compose-auto-update is a Bash script that automates the process of updating Docker containers based on Docker Compose for your microservices. The script iterates through all the directories of your Docker services and checks if there are any updates available for the Docker images. If an update is found, the script will stop the current container, update the image, and then restart the container with the latest version.

## Disclaimer

Please note that the docker-compose-auto-update script is provided as-is and may contain bugs or limitations. Use it at your own risk, and make sure to backup your data before running the script to update your Docker containers.

## Usage

1.  Clone the repository or copy the content of the `docker-compose-auto-update.sh` script to your server where your Docker services are located.

2.  Open a terminal and navigate to the directory where you placed the script.

3.  Grant execution permissions to the script with the following command:

`chmod +x docker-compose-auto-update.sh`

Execute the script with the following command:

`./docker-compose-auto-update.sh`

The script will check each Docker service and inform you if an update is available. If an update is found, the script will perform the update process and restart the container with the latest version.

## Requirements

- Docker installed on the system.
- Docker Compose installed on the system.
- Write access to the directories of your Docker services.
- Exectuion permissions for the script.

## Troubleshooting

If you encounter any issues while using the docker-compose-auto-update script, please refer to the documentation for Docker and Docker Compose for troubleshooting. Additionally, you can seek assistance from the community or open an issue on the GitHub repository.

## Contributing

Contributions to this project are welcome! If you find any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

