#!/bin/bash

MONITORING_URL="https://test.com/monitoring/test/api"

LOG_FILE="/var/log/monitoring.log"

PREVIOUS_PID_FILE="/var/run/test_previous_pid"

process_info=$(ps aux | grep '[t]est')

current_pid=$(echo "$process_info" | awk '{print $2}')

if [[ -n "$current_pid" ]]; then
    
    echo "$(date): Найден процесс: $process_info" >> $LOG_FILE

    
    if curl -s --head --request GET $MONITORING_URL | grep "200 OK" > /dev/null; then
        echo "$(date): Процесс 'test' работает, сервер доступен." >> $LOG_FILE
    else
        echo "$(date): Сервер мониторинга не доступен." >> $LOG_FILE
    fi

    
    if [[ -f $PREVIOUS_PID_FILE ]]; then
        previous_pid=$(cat $PREVIOUS_PID_FILE)
        if [[ "$current_pid" != "$previous_pid" ]]; then
            echo "$(date): Процесс 'test' был перезапущен. Старый PID: $previous_pid, Новый PID: $current_pid" >> $LOG_FILE
        fi
    fi


    echo "$current_pid" > $PREVIOUS_PID_FILE
else
    echo "$(date): Процесс 'test' не найден." >> $LOG_FILE
fi