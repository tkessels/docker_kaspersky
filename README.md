# docker_kaspersky
Simple Ubuntu-Image with Kaspersky Virusscanner.
## For Simple Scan of Folder
docker run -it --rm -v '/folder/to/scan':/data tabledevil/kaspersky scan
## Prevent any changes to Files (just scan)
docker run -it --rm -v '/folder/to/scan':/data:ro tabledevil/kaspersky scan
## Prevent Container from phoning home 
docker run -it --rm -v '/folder/to/scan':/data:ro --network none  tabledevil/kaspersky scan
