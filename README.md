# ResTips - Interactive Restaurant Webapp for Managers, Employees, and Customers

# Team Members
- Long Nguyen: Project Leader and Hardware Developer
- Michael Nugent: Fullstack Developer
- Arandeep Hayer: Fullstack Developer
- Vi Nguyen: Fullstack Developer
- Daniel Martinez: Front-End Developer 

# Developement Process - Agile Iterative Approach
![Incremental Agile](https://github.com/FS-CSCI150-F21/FS-CSCI150-F21-Team1/blob/main/wiki_resources/Iterative_Process_Diagram.svg.png)
# Installation Notes
MySQLi
In order to work on any pages related to the mySQL database, it is necessary to have the MySQLi PHP extension installed.  It enables PHP to communicate with the MySQL database.  The scripts to create the database, tables, records, and user should be found under the sql directory.


Ngrok - People Counter
Ngrok must be configured to account.  MySQL default port is 3306.  Use TCP, not HTTP.
Terminal command "./ngrok tcp 3306" starts a tunnel with a random ip address.
Terminal command "./ngrok tcp --region=us --remote-addr=3.tcp.ngrok.io:26206 3306" starts a tunnel with stable ip address "3.tcp.ngrok.io:26206".  Host computer needs to be aunthenticated to use.

Ngrok - Browser/Presentation
Terminal command "./ngrok http --region=us --hostname=csci150projectrestips.ngrok.io 80" starts an HTTP (web browser) tunnel to stable ip address "csci150projectrestips.ngrok.io".  Host computer needs to be authenticated to use.
