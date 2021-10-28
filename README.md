# FS-CSCI150-F21-Team1
This software will be run on the Raspberry Pi 4 microprocessor. This is an auxilary software only available to the restaurant owner/manager.

# Quickstart:
- download and run xampp db control panel, start apache and mysql service
- (if first time) create a new table with name `people_count`, with columns `num_people_inside` int, `date_time` datetime, and `id` int with auto increment as key.
- go to People-Counting-in-Real-Time-master directory and open terminal/powershell
- (if first time) pip install -r requirements.txt
- python run.py --prototxt mobilenet_ssd/MobileNetSSD_deploy.prototxt --model mobilenet_ssd/MobileNetSSD_deploy.caffemodel
