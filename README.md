Создать файл скрипта: /root/test-monitoring.sh;
Cделать скрипт исполняемым: chmod +x /root/test-monitoring.sh;

Создать unit-файл systemd: /etc/systemd/system/monitor_test.service;
Создать unit-файл таймер: /etc/systemd/system/monitor_test.timer;

Активируйте и запустите таймер:
sudo systemctl enable monitor_test.timer;
sudo systemctl start monitor_test.timer;

Запустить сервис можно вручную:
sudo systemctl start monitor_test.service;

![image](https://github.com/user-attachments/assets/9a7a8727-ef81-4824-a833-798bb9457599)
