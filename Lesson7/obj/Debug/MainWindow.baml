   M S B A M L   `   `   `  ����B  >Lesson7, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:Lesson7Lesson7  5   	       Lesson7.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Lesson7     5   	   -   5          � Title$1  +Сотрудники Предприятия��5   	   $��381.069��6(   $��642.572��69    � 
ResizeMode$ NoResize=�6`    � WindowStartupLocation$ CenterScreen=�6v    � 	Resources 5	      ��%    5
      .��5      � .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ allEmployeeDataGrid��5      $	��184��60   $��	10,10,0,0q�6=   $	��Top=�6P      
IsReadOnly . $
��Left=�6�   $	��609��6�   ��6h   ��  �� Mode$ OneWay=�6�   �� 5   
   -   5         ��Name$ editEmpl��5      $)��#Изменить Работника��6#   $
��Left=�6@   $��304,214,0,0q�6[   $	��Top=�6p   $	��131��6�   {�.  6�     5   
   -   5        $ alldepDataGrid��5      $
��Left=�6+   $	��141��6F   $��
10,199,0,0q�6S   $	��Top=�6g   $	��247��6   ��6�   �� �� 5   
   -   5        $ addEmpl��5      $)��#Добавить Работника��6"   $
��Left=�6?   $��304,239,0,0q�6Z   $	��Top=�6o   $	��131��6�   {�.  6�   �� 5   
   -   5        $ editDep��5      $!��Изменить Отдел��6"   $
��Left=�6;   $��444,214,0,0q�6V   $	��Top=�6k   $	��131��6�   {�.  6�   �� 5   
   -   5        $ addDep��5      $!��Добавить Отдел��6!   $
��Left=�6:   $��444,239,0,0q�6U   $	��Top=�6j   $	��131��6�   {�.  6�   �� 5   
   -   5        $ buttonConnect��5      $$��Подключение к БД��6(   $
��Left=�6C   $��304,264,0,0q�6^   $	��Top=�6s   $	��271��6�   5      5      