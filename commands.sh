[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/django_app/DjangoBlog_App/django_project
ExecStart=/home/ubuntu/django_app/DjangoBlog_App/env/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          django_project.wsgi:application

[Install]
WantedBy=multi-user.target