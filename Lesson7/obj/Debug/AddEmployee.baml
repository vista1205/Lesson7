   M S B A M L   `   `   `  ����B  >Lesson7, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:Lesson7Lesson7  5   	       Lesson7.AddEmployee   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Lesson7     5   	     � Title$<  6Добавление Нового Сотрудника��5   	   $��248.41��6.   $��372.109��6>    � WindowStartupLocation$ CenterScreen=�6N    � 
ResizeMode$ NoResize=�6s   .��5	      � .+�5
   
   �� -   5         ��Name$ label��5
      $��ФИО: ��6   $
��Left=�6/   $��	10,10,0,0q�6J   $	��Top=�6]   �� 5   
   -   5        $ label1��5      $!��Дата рождения: ��6    $
��Left=�6:   $��	10,41,0,0q�6U   $	��Top=�6h   �� 5   
   -   5        $ label2��5      $��E-mail: ��6    $
��Left=�63   $��	10,72,0,0q�6N   $	��Top=�6a   �� 5   
   -   5        $ label4��5      $��Телефон��6    $
��Left=�62   $��
10,103,0,0q�6M   $	��Top=�6a   �� 5   
   -   5         ��Name$ 
saveButton��5      $��Сохранить��6%   $
��Left=�69   $��
10,175,0,0q�6T   $	��Top=�6h   $��75��6�   6�   �� 5   
   -   5        $ cancelButton��5      $��Отмена��6'   $
��Left=�68   $��270,175,0,0q�6S   $	��Top=�6h   $��75��6�   6�   �� 5   
   -   5         ��Name$ 
FIOtextBox��5      $
��Left=�6&   $��23��6A   $��
125,10,0,0q�6M    �� TextWrapping$
 Wrap=�6a   $	��Top=�6u   $	��220��6�   �� 5   
   -   5        $ MailtextBox��5      $
��Left=�6'   $��23��6B   $��
125,75,0,0q�6N   $
 Wrap=�6b   $	��Top=�6v   $	��220��6�   �� 5   
   -	   5        $ PhonetextBox��5      $
��Left=�6(   $��23��6C   $��125,107,0,0q�6O   $
 Wrap=�6d   $	��Top=�6x   $	��220��6�   (  "System.Windows.Controls.DatePicker  5   
   -
   5          Name$ edtdatePicker��5      $
��Left=�6,   $��
125,43,0,0q�6G   $	��Top=�6[   $	��220��6s   �� 5   
   -   5         ��Name$ addDepComboBox��5      $
��Left=�6+   $��125,135,0,0q�6F   $	��Top=�6[   $	��220��6s   	 � ToolTip$!	 Выберите отдел��6�   $��22��6�   ��6   �� ��5      �� 5      .R�5      �� ��6    �� *Департамент+5      5      �� 5   
   -   5        $ label3��5      $��Департамент��6    $
��Left=�66   $��
15,135,0,0q�6Q   $	��Top=�6e   $��95��6}   5      5      