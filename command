docker build -t avisenaalwi/node-oracledb-lite:1.0.1 .
docker build -t avisenaalwi/node-oracledb-lite:latest .
docker push avisenaalwi/node-oracledb-lite:1.0.1
docker push avisenaalwi/node-oracledb-lite:latest
A lightweight Docker image based on Node.js Alpine, optimized for Node.js app with an OracleDB