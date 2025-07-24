### Deploying an Application Using Nginx
#### About This Project  
This project demonstrates deploying applications using Nginx, showcasing a setup reminiscent of deployment practices from 2005.
1. **Setting Up API Servers**  
    Two API servers were set up:  
    - A Node.js server running on port `3000`.  
    - A Python server running on port `5000`.  

    Both servers were started using the `run.sh` script after installing all the dependencies.

2. **Updating `/etc/hosts`**  
    Added the following entries to the `/etc/hosts` file:  
    ```plaintext
    127.0.0.1 app1.local
    127.0.0.1 app2.local
    ```

3. **Configuring Nginx**  
    Configured Nginx to route traffic to the respective servers using the following steps:  

    - Create a new file in `/etc/nginx/sites-available/` named `app1.conf` with the following content:
      ```nginx
      server {
            listen 80;
            server_name app1.local;

            location / {
                 proxy_pass http://127.0.0.1:3000;
            }
      }
      ```

    - Create another file in `/etc/nginx/sites-available/` named `app2.conf` with the following content:
      ```nginx
      server {
            listen 80;
            server_name app2.local;

            location / {
                 proxy_pass http://127.0.0.1:5000;
            }
      }
      ```

    - Enable the configurations by creating symbolic links in `/etc/nginx/sites-enabled/`:
      ```bash
      sudo ln -s /etc/nginx/sites-available/app1.conf /etc/nginx/sites-enabled/
      sudo ln -s /etc/nginx/sites-available/app2.conf /etc/nginx/sites-enabled/
      ```

4. **Testing in Browser**  
    Access `http://app1.local` and `http://app2.local` in the browser to verify the setup.

5. **Demo Video**  
    Below is a demo video showcasing the deployment process:  
    [![Demo Video](https://img.youtube.com/vi/1KHZ4vXCm1I/sddefault.jpg)](https://www.youtube.com/watch?v=1KHZ4vXCm1I)


### A Simple Diagram
![Deployment Diagram](diagram.svg)
