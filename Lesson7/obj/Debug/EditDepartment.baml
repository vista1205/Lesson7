   M S B A M L   `   `   `  ����B  >Lesson7, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:Lesson7Lesson7  5   	       Lesson7.EditDepartment   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Lesson7     5   	     � Title$;  5Редактирование Департамента��5   	   $��180.78��6-   $��372.109��6=    � WindowStartupLocation$ CenterScreen=�6M    � 
ResizeMode$ NoResize=�6r   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $	��61* �6   �� 5      $	��13* �6   .+�5   
   �� -   5         ��Name$ label��5      $$��Старое название:��6   $
��Left=�6:   $��	32,24,0,0q�6U   $	��Top=�6h   �� 5   
   -   5        $ oldName��5      $��Label��6!   $
��Left=�61   $��
148,24,0,0q�6L   $	��Top=�6`   $��2��6x   $	��195��6�   �� 5   
   -   5        $ label_Copy1��5      $"��Новое название:��6%   $
��Left=�6?   $��	32,55,0,0q�6Z   $	��Top=�6m   �� 5   
   -   5         ��Name$ newName��5      $
��Left=�6#   $��23��6>   $��
148,55,0,0q�6J    �� TextWrapping$
 Wrap=�6^   $	��Top=�6r   $	��195��6�   $��2��6�   �� 5   
   -   5         ��Name$ 
saveButton��5      $��Сохранить��6%   $
��Left=�69   $��
32,103,0,0q�6T   $	��Top=�6h   $��75��6�   6�   �� 5   
   -   5        $ cancelButton��5      $��Отмена��6'   $
��Left=�68   $��268,103,0,0q�6S   $	��Top=�6h   $��75��6�   $��2��6�   5      5      