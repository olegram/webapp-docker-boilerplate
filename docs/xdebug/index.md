Настройка xdebug в PhpStorm
===========================
1. В `.env` файле, в переменной `XDEBUG_REMOTE_HOST` укажите адрес вашей host машины. Он нужен для дебага консольных скриптов. Обычно это ваш IP адрес.
  > Selects the host where the debug client is running, you can either use a host name, IP address, or 'unix:///path/to/sock' for a Unix domain socket.
2. Настройте PhpStorm:
  ![php-storm-1](images/php-storm-1.png)
  ![php-storm-2](images/php-storm-2.png)
  ![php-storm-3](images/php-storm-3.png)
3. Включите прослушку и пользуйтесь.
  ![php-storm-4](images/php-storm-4.png)