FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        i      	 
 	 I     ������
�� .aevtoappnull  �   � ****��  ��   
 Q    �     k   �       O   �    k   �       l   ��  ��    , & Get the frontmost application process     �   L   G e t   t h e   f r o n t m o s t   a p p l i c a t i o n   p r o c e s s      r        6       4   �� 
�� 
pcap  m   	 
����   =      !   1    ��
�� 
pisf ! m    ��
�� boovtrue  o      ���� 0 frontapp frontApp   " # " r     $ % $ n     & ' & 1    ��
�� 
pnam ' o    ���� 0 frontapp frontApp % o      ���� 0 frontappname frontAppName #  ( ) ( l   ��������  ��  ��   )  * + * l   �� , -��   , 3 - Get all windows of the frontmost application    - � . . Z   G e t   a l l   w i n d o w s   o f   t h e   f r o n t m o s t   a p p l i c a t i o n +  / 0 / r    " 1 2 1 n      3 4 3 2    ��
�� 
cwin 4 o    ���� 0 frontapp frontApp 2 o      ���� 0 
windowlist 
windowList 0  5 6 5 r   # * 7 8 7 I  # (�� 9��
�� .corecnte****       **** 9 o   # $���� 0 
windowlist 
windowList��   8 o      ���� 0 windowcount windowCount 6  : ; : l  + +��������  ��  ��   ;  < = < l  + +�� > ?��   > %  Check if there are any windows    ? � @ @ >   C h e c k   i f   t h e r e   a r e   a n y   w i n d o w s =  A B A Z   + ? C D���� C =  + . E F E o   + ,���� 0 windowcount windowCount F m   , -����   D k   1 ; G G  H I H I  1 8�� J��
�� .sysonotfnull��� ��� TEXT J b   1 4 K L K m   1 2 M M � N N ( N o   w i n d o w s   f o u n d   i n   L o   2 3���� 0 frontappname frontAppName��   I  O�� O L   9 ;����  ��  ��  ��   B  P Q P l  @ @��������  ��  ��   Q  R S R l  @ @�� T U��   T 1 + Find all windows including fullscreen ones    U � V V V   F i n d   a l l   w i n d o w s   i n c l u d i n g   f u l l s c r e e n   o n e s S  W X W r   @ D Y Z Y J   @ B����   Z o      ���� 0 
allwindows 
allWindows X  [ \ [ X   E � ]�� ^ ] Q   U � _ ` a _ Z   X t b c�� d b =  X f e f e n   X d g h g 1   ` d��
�� 
valL h n   X ` i j i 4   Y `�� k
�� 
attr k m   \ _ l l � m m  A X F u l l S c r e e n j o   X Y���� 0 w   f m   d e��
�� boovtrue c k   i m n n  o p o l  i i�� q r��   q !  Include fullscreen windows    r � s s 6   I n c l u d e   f u l l s c r e e n   w i n d o w s p  t�� t s   i m u v u o   i j���� 0 w   v n       w x w  ;   k l x o   j k���� 0 
allwindows 
allWindows��  ��   d k   p t y y  z { z l  p p�� | }��   |   Include regular windows    } � ~ ~ 0   I n c l u d e   r e g u l a r   w i n d o w s {  ��  s   p t � � � o   p q���� 0 w   � n       � � �  ;   r s � o   q r���� 0 
allwindows 
allWindows��   ` R      ������
�� .ascrerr ****      � ****��  ��   a k   | � � �  � � � l  | |�� � ���   � = 7 Include windows where we can't check fullscreen status    � � � � n   I n c l u d e   w i n d o w s   w h e r e   w e   c a n ' t   c h e c k   f u l l s c r e e n   s t a t u s �  ��� � s   | � � � � o   | }���� 0 w   � n       � � �  ;   ~  � o   } ~���� 0 
allwindows 
allWindows��  �� 0 w   ^ o   H I���� 0 
windowlist 
windowList \  � � � l  � ���������  ��  ��   �  � � � r   � � � � � I  � ��� ���
�� .corecnte****       **** � o   � ����� 0 
allwindows 
allWindows��   � o      ���� 0 windowcount windowCount �  � � � Z   � � � ����� � =  � � � � � o   � ����� 0 windowcount windowCount � m   � �����   � k   � � � �  � � � I  � ��� ���
�� .sysonotfnull��� ��� TEXT � b   � � � � � m   � � � � � � � > N o   a c c e s s i b l e   w i n d o w s   f o u n d   i n   � o   � ����� 0 frontappname frontAppName��   �  ��� � L   � �����  ��  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � %  Find the current active window    � � � � >   F i n d   t h e   c u r r e n t   a c t i v e   w i n d o w �  � � � r   � � � � � m   � � � � � � �   � o      ���� 0 currentwindow currentWindow �  � � � Y   � � ��� � ��� � k   � � � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 i   � o   � ����� 0 
allwindows 
allWindows � o      ���� 0 
thiswindow 
thisWindow �  ��� � Q   � � � ��� � Z   � � � ����� � =  � � � � � n   � � � � � 1   � ���
�� 
valL � n   � � � � � 4   � ��� �
�� 
attr � m   � � � � � � �  A X M a i n � o   � ����� 0 
thiswindow 
thisWindow � m   � ���
�� boovtrue � k   � � � �  � � � r   � � � � � o   � ����� 0 
thiswindow 
thisWindow � o      ���� 0 currentwindow currentWindow �  ��� �  S   � ���  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  �� 0 i   � m   � �����  � o   � ����� 0 windowcount windowCount��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � : 4 If no window is found as main, use the first window    � � � � h   I f   n o   w i n d o w   i s   f o u n d   a s   m a i n ,   u s e   t h e   f i r s t   w i n d o w �  � � � Z   � � ����� � =  � � � � � o   � ����� 0 currentwindow currentWindow � m   � � � � � � �   � r   � � � � n   �  � � � 4   � �� �
�� 
cobj � m   � �����  � o   � ����� 0 
allwindows 
allWindows � o      ���� 0 currentwindow currentWindow��  ��   �  � � � l 		��������  ��  ��   �  � � � l 		�� � ���   � ' ! Find the index of current window    � � � � B   F i n d   t h e   i n d e x   o f   c u r r e n t   w i n d o w �  � � � r  	 � � � m  	
����  � o      ���� 0 currentindex currentIndex �  � � � Y  4 �� � ��~ � Z  / � ��}�| � = ! � � � n   � � � 4  �{ �
�{ 
cobj � o  �z�z 0 i   � o  �y�y 0 
allwindows 
allWindows � o   �x�x 0 currentwindow currentWindow � k  $+ � �  �  � r  $) o  $%�w�w 0 i   o      �v�v 0 currentindex currentIndex  �u  S  *+�u  �}  �|  � 0 i   � m  �t�t  � o  �s�s 0 windowcount windowCount�~   �  l 55�r�q�p�r  �q  �p    l 55�o	�o   "  Calculate next window index   	 �

 8   C a l c u l a t e   n e x t   w i n d o w   i n d e x  r  5> [  5: o  58�n�n 0 currentindex currentIndex m  89�m�m  o      �l�l 0 	nextindex 	nextIndex  Z  ?P�k�j ?  ?D o  ?B�i�i 0 	nextindex 	nextIndex o  BC�h�h 0 windowcount windowCount r  GL m  GH�g�g  o      �f�f 0 	nextindex 	nextIndex�k  �j    l QQ�e�d�c�e  �d  �c    l QQ�b�b   !  Bring next window to front    � 6   B r i n g   n e x t   w i n d o w   t o   f r o n t  �a  O  Q�!"! Q  Z�#$%# k  ]�&& '(' l ]]�`)*�`  ) ( " First attempt to raise the window   * �++ D   F i r s t   a t t e m p t   t o   r a i s e   t h e   w i n d o w( ,-, I ]i�_.�^
�_ .prcsperfnull���     actT. 4  ]e�]/
�] 
actT/ m  ad00 �11  A X R a i s e�^  - 232 l jj�\�[�Z�\  �[  �Z  3 454 l jj�Y67�Y  6 9 3 If the window is fullscreen, ensure it's activated   7 �88 f   I f   t h e   w i n d o w   i s   f u l l s c r e e n ,   e n s u r e   i t ' s   a c t i v a t e d5 9�X9 Z  j�:;�W�V: = jx<=< n  jv>?> 1  rv�U
�U 
valL? 4  jr�T@
�T 
attr@ m  nqAA �BB  A X F u l l S c r e e n= m  vw�S
�S boovtrue; r  {�CDC J  {EE FGF m  {|�R�R  G H�QH m  |}�P�P  �Q  D 1  ��O
�O 
posn�W  �V  �X  $ R      �N�M�L
�N .ascrerr ****      � ****�M  �L  % k  ��II JKJ l ���KLM�K  L 1 + Fallback method if the first attempt fails   M �NN V   F a l l b a c k   m e t h o d   i f   t h e   f i r s t   a t t e m p t   f a i l sK O�JO Q  ��PQ�IP r  ��RSR 1  ���H
�H 
posnS 1  ���G
�G 
posnQ R      �F�E�D
�F .ascrerr ****      � ****�E  �D  �I  �J  " l QWT�C�BT n  QWUVU 4  RW�AW
�A 
cobjW o  SV�@�@ 0 	nextindex 	nextIndexV o  QR�?�? 0 
allwindows 
allWindows�C  �B  �a    m    XX�                                                                                  sevs  alis    \  Macintosh HD               �7��BD ����System Events.app                                              �����7��        ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    Y�>Y l ���=�<�;�=  �<  �;  �>    R      �:Z�9
�: .ascrerr ****      � ****Z o      �8�8 0 errmsg errMsg�9    I ���7[�6
�7 .sysonotfnull��� ��� TEXT[ b  ��\]\ m  ��^^ �__ . E r r o r   c y c l i n g   w i n d o w s :  ] o  ���5�5 0 errmsg errMsg�6    `�4` l     �3�2�1�3  �2  �1  �4       �0abcde�/fgg�.�-�,�+�*�)�(�'�0  a �&�%�$�#�"�!� ���������
�& .aevtoappnull  �   � ****�% 0 frontapp frontApp�$ 0 frontappname frontAppName�# 0 
windowlist 
windowList�" 0 windowcount windowCount�! 0 
allwindows 
allWindows�  0 currentwindow currentWindow� 0 
thiswindow 
thisWindow� 0 currentindex currentIndex� 0 	nextindex 	nextIndex�  �  �  �  �  �  b � 
��hi�
� .aevtoappnull  �   � ****�  �  h ���� 0 w  � 0 i  � 0 errmsg errMsgi $X�j�����
�	�� M����� l�� �� � ����� � �������0��A����^
� 
pcapj  
� 
pisf� 0 frontapp frontApp
� 
pnam� 0 frontappname frontAppName
�
 
cwin�	 0 
windowlist 
windowList
� .corecnte****       ****� 0 windowcount windowCount
� .sysonotfnull��� ��� TEXT� 0 
allwindows 
allWindows
� 
kocl
� 
cobj
� 
attr
� 
valL�   ��  �� 0 currentwindow currentWindow�� 0 
thiswindow 
thisWindow�� 0 currentindex currentIndex�� 0 	nextindex 	nextIndex
�� 
actT
�� .prcsperfnull���     actT
�� 
posn�� 0 errmsg errMsg�����*�k/�[�,\Ze81E�O��,E�O��-E�O�j 	E�O�j  ��%j OhY hOjvE�O ?�[��l 	kh   !�a a /a ,e  	��6GY ��6GW X  ��6G[OY��O�j 	E�O�j  a �%j OhY hOa E` O Ck�kh ��/E` O %_ a a /a ,e  _ E` OY hW X  h[OY��O_ a   ��k/E` Y hOkE` O $k�kh ��/_   �E` OY h[OY��O_ kE` O_ � 
kE` Y hO��_ / P 1*a a /j O*a a  /a ,e  jjlv*a !,FY hW X   *a !,*a !,FW X  hUUOPW X " a #�%j c kk X��l
�� 
pcapl �mm  f i r e f o xd �nn  f i r e f o xe ��o�� o  pqp rr s��ts X��u
�� 
pcapu �vv  f i r e f o x
�� 
cwint �ww R C y c l e   T h r o u g h   A p p   W i n d o w s   o n   M a c   -   C l a u d eq xx y��zy X��{
�� 
pcap{ �||  f i r e f o x
�� 
cwinz �}} d C o m p a r i n g   J S O N - R P C   2 . 0   R e q u e s t   S t r u c t u r e s   -   C l a u d e�/ f ��~�� ~  g���������������������������� �� e����
�� 
cobj�� g �� e����
�� 
cobj�� ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �. �- �,  �+  �*  �)  �(  �'  ascr  ��ޭ