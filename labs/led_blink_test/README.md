# Простейший проект моргающего диода

## Quartus and driver installation

Установите [Quartus и драйвера](https://github.com/BusseAA/FPGA_introduction_course/wiki/Quartus-and-USB-Blaster)

## Create project

* New Project Wizard
* Directory, Name, Top-Level Entity
    * Directory: выберите labs/led_blink_test в качестве директории проекта.
    * Project Name: led_blink (Название проекта можно выбрать любым, но лучше тем же что и top-level entity)
    * Top-Level Entity: led_blink (Так как модуль в данном проекте назван led_blink в файле led_blink.v).
*  Project Type
    *  Empty project
*  Add Files
    *  Добавьте файл led_blink.v
*  Device
    *  Выберите свое устройство. Свою модель можно посмотреть на чипе (либо EP4CE6E22C8 либо EP4CE6F17I7)
*  Далее Next до конца.

## Pin assignment
Необходимо ассоциировать модуля верхнего уровня (Top level entity) с пинами чипа.  
Для этого необходимо знать разводку платы. Для этого нужна документация на плату.  
Для чипа EP4CE6E22C8 - [schematic](https://github.com/BusseAA/FPGA_introduction_course/blob/main/docs/schematic_v200.pdf).  
Для чипа EP4CE6F17I7 - [User manual](https://github.com/BusseAA/FPGA_introduction_course/blob/main/docs/AX301_English_ug_V1.0.pdf).  
* Откройте окно Pin Planer (Assignments->Pin Planer).
* Добавьте ассоциации для входов/выходов модуля led_blink (Найдите в документации почему были выбраны именно эти пины).
  * clk
    * Node Name: clk
    * Location: EP4CE6E22C8 - ? / EP4CE6F17I7 - PIN_E1
  * led1
    * Node Name: led1
    * Location: PIN_E10
  * led2
    * Node Name: led2
    * Location: PIN_F9

## Compile Design and Program device
Скомпилируйте проект
![image](https://github.com/user-attachments/assets/682f964f-9435-4fac-8aab-41c848633cee)

Прошейте устройство.
* Подключите питание платы. (так же на плате есть switch для питания. Передвиньте его в положение ON).
* Подключите JTAG.
* Откройте окно Program Device
* Если программатор не был выбран автоматически, выберите его
* Прошейте устройство
* Вы должны увидеть как 2 диода поочередно мигают  
![image](https://github.com/user-attachments/assets/7a9fc0ce-80a5-4c25-a408-0add8e10fd51)
![image](https://github.com/user-attachments/assets/0edfd76c-50b0-4e0b-ac60-8d9e9cd60f0e)
![image](https://github.com/user-attachments/assets/2d8497dd-3e92-43ca-bc6c-3d80f254a73b)
![image](https://github.com/user-attachments/assets/3a958238-9991-4790-8b7d-f2aa85d5907c)
![image](https://github.com/user-attachments/assets/a0df6264-ce63-4b35-9fbd-bd0e116a36b8)




