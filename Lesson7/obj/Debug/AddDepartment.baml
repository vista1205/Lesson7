   M S B A M L   `   `   `  ����B  >Lesson7, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:Lesson7Lesson7  5   	       Lesson7.AddDepartment   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Lesson7     5   	     � Title$4  .Добавление Нового Отдела��5   	   $��141.763��6*   $��394.22��6;    � 
ResizeMode$ NoResize=�6J    � WindowStartupLocation$ CenterScreen=�6`   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $
��161* �6   �� 5      $	��32* �6   .+�5   
   �� -   5         ��Name$ 
saveButton��5      $��Сохранить��6%   $
��Left=�69   $��	23,69,0,0q�6T   $	��Top=�6g   $��75��6   6�   �� 5   
   -   5        $ cancelButton��5      $��Отмена��6'   $
��Left=�68   $��
284,69,0,0q�6S   $	��Top=�6g   $��75��6   $��2��6�   �� 5   
   -   5         ��Name$ label��5      $(��"Новый департамент:��6   $
��Left=�6<   $��	23,21,0,0q�6W   $	��Top=�6j   $	��137��6�   �� 5   
   -   5         ��Name$ addDeptextBox��5      $
��Left=�6)   $��23��6D   $��
160,25,0,0q�6P    �� TextWrapping$
 Wrap=�6d   $	��Top=�6x   $	��199��6�   $��2��6�   5      5      