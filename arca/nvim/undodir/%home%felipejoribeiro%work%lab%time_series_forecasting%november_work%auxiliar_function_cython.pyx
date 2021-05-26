Vim�UnDo� W�� q.��Q�Ԓȑ�-">��Ε>��c�    0   3					final_array[i,ii,iii] = a[i][iii] - b[ii][iii]      	                       `���    _�                            ����                                                                                                                                                                                                                                                                                                                            	                    V        `���     �         0      P@cython.wraparound(False)	# turn off negative index wrapping for entire function�      
          3												 a,np.ndarray[np.float64_t, ndim=2] b):�   	             		"""�   
             4		Function to implement the most time cossuming line�                		"""�                M		final_array = np.zeros([a.shape[0],a.shape[0],a.shape[1]], dtype = a.dtype)�                		cdef int i, ii, iii�                		for i in range(a.shape[0]):�                 				for ii in range(b.shape[0]):�                #						for iii in range(a.shape[1]):�                6								final_array[i,ii,iii] = a[i][iii] - b[ii][iii]�                		return final_array�                P@cython.wraparound(False)	# turn off negative index wrapping for entire function�                4													 a,np.ndarray[np.float64_t, ndim=2] b):�                		"""�                4		Function to implement the most time cossuming line�                		"""�                 3		cdef np.ndarray[np.float64_t, ndim=3] final_array�       "          9		final_array = a[:, np.newaxis, :] - b[np.newaxis, :, :]�   "   $          		return final_array�   %   '          P@cython.wraparound(False)	# turn off negative index wrapping for entire function�   '   )          4													 a,np.ndarray[np.float64_t, ndim=2] b):�   (   *          		"""�   )   +          4		Function to implement the most time cossuming line�   *   ,          		"""�   +   -          3		cdef np.ndarray[np.float64_t, ndim=3] final_array�   -   /          -		final_array = a[:, None, :] - b[None, :, :]�   /   1          		return final_array5��                        �                     �                         '                    �                        (                    �                        )                    �                        *                    �                        +                    �                        ,                    �                        -                    �                        .                    �                        /                    �       	                 0                    �       
                 1                    �                        2                    �    	                     [                    �    	                    \                    �    
                     a                    �    
                    b                    �                         �                    �                        �                    �                         �                    �                        �                    �                         �                    �                        �                    �                                             �                                            �                                             �                                             �                        !                    �                        "                    �                         @                    �                        A                    �                        B                    �                        C                    �                        D                    �                        E                    �                         d                    �                        e                    �                        f                    �                        g                    �                        h                    �                        i                    �                        j                    �                        k                    �                         �                    �                        �                    �                                            �                         �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �       	                 �                    �       
                 �                    �                        �                    �                        �                    �                         �                    �                        �                    �                         �                    �                        �                    �                         �                    �                        �                    �                                              �                                            �                          5                    �                         6                    �    "                     p                    �    "                    q                    �    %                    �                    �    '                     ]                    �    '                    ^                    �    '                    _                    �    '                    `                    �    '                    a                    �    '                    b                    �    '                    c                    �    '                    d                    �    '                    e                    �    '   	                 f                    �    '   
                 g                    �    '                    h                    �    '                    i                    �    (                     �                    �    (                    �                    �    )                     �                    �    )                    �                    �    *                     �                    �    *                    �                    �    +                     �                    �    +                    �                    �    -                                         �    -                    	                    �    /                     7                    �    /                    8                    5�_�      	                      ����                                                                                                                                                                                                                                                                                                                            	                    V        `���     �              5��                          �                     5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                            	                    V        `���     �              5��                          �                     5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                            	                    V        `���     �              5��                          2                     5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            	                    V        `���     �               5��                          l                     5�_�                    )        ����                                                                                                                                                                                                                                                                                                                            	                    V        `��     �   (   *        5��    (                                           5�_�                    *        ����                                                                                                                                                                                                                                                                                                                            	                    V        `��     �   )   +        5��    )                      1                     5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            	                    V        `��     �   #   %   *      ,						a,np.ndarray[np.float64_t, ndim=2] b):5��    #                     _                     5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            	                    V        `��     �   #   %   *      -							a,np.ndarray[np.float64_t, ndim=2] b):5��    #                     _                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            	                    V        `��"     �         *      -							a,np.ndarray[np.float64_t, ndim=2] b):5��                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            	                    V       `��*     �         *      5							final_array[i,ii,iii] = a[i][iii] - b[ii][iii]5��                         j                     5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                V       `��1     �         *      2											 a,np.ndarray[np.float64_t, ndim=2] b):   	"""   3	Function to implement the most time cossuming line   	"""   L	final_array = np.zeros([a.shape[0],a.shape[0],a.shape[1]], dtype = a.dtype)   	cdef int i, ii, iii   	for i in range(a.shape[0]):   			for ii in range(b.shape[0]):   "					for iii in range(a.shape[1]):   4						final_array[i,ii,iii] = a[i][iii] - b[ii][iii]   	return final_array5��                        2                    �    	                     [                     �    
                     `                     �                         �                     �                         �                     �                         �                     �                         �                     �                                              �                         <                     �                         `                     �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��7     �          *      	"""   3	Function to implement the most time cossuming line   	"""   2	cdef np.ndarray[np.float64_t, ndim=3] final_array   8	final_array = a[:, np.newaxis, :] - b[np.newaxis, :, :]   	return final_array5��                         �                     �                         �                     �                         �                     �                         �                     �                                              �                         U                     5�_�                    %        ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��;     �   $   +          	"""   3	Function to implement the most time cossuming line   	"""   2	cdef np.ndarray[np.float64_t, ndim=3] final_array   ,	final_array = a[:, None, :] - b[None, :, :]   	return final_array5��    $                     o                     �    %                     t                     �    &                     �                     �    '                     �                     �    (                     �                     �    )                                          5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��D     �      
   *      -							a,np.ndarray[np.float64_t, ndim=2] b):5��                        -                    �                        -                    5�_�                           ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��R     �         *      3					final_array[i,ii,iii] = a[i][iii] - b[ii][iii]5��                         Z                     5�_�                       	    ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��T     �         *      !				for iii in range(a.shape[1]):5��                         6                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��U     �         *      		for ii in range(b.shape[0]):5��                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                            %          *          V       `��V     �         *       			for iii in range(a.shape[1]):5��                         4                     5�_�                        	    ����                                                                                                                                                                                                                                                                                                                                                             `��W    �         *      2				final_array[i,ii,iii] = a[i][iii] - b[ii][iii]5��                         V                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `�Ȧ     �         0      P@cython.wraparound(False)	# turn off negative index wrapping for entire function�      
          3												 a,np.ndarray[np.float64_t, ndim=2] b):�   	             		"""�   
             4		Function to implement the most time cossuming line�                		"""�                M		final_array = np.zeros([a.shape[0],a.shape[0],a.shape[1]], dtype = a.dtype)�                		cdef int i, ii, iii�                		for i in range(a.shape[0]):�                 				for ii in range(b.shape[0]):�                #						for iii in range(a.shape[1]):�                6								final_array[i,ii,iii] = a[i][iii] - b[ii][iii]�                		return final_array�                P@cython.wraparound(False)	# turn off negative index wrapping for entire function�                4													 a,np.ndarray[np.float64_t, ndim=2] b):�                		"""�                4		Function to implement the most time cossuming line�                		"""�                 3		cdef np.ndarray[np.float64_t, ndim=3] final_array�       "          9		final_array = a[:, np.newaxis, :] - b[np.newaxis, :, :]�   "   $          		return final_array�   %   '          P@cython.wraparound(False)	# turn off negative index wrapping for entire function�   '   )          4													 a,np.ndarray[np.float64_t, ndim=2] b):�   (   *          		"""�   )   +          4		Function to implement the most time cossuming line�   *   ,          		"""�   +   -          3		cdef np.ndarray[np.float64_t, ndim=3] final_array�   -   /          -		final_array = a[:, None, :] - b[None, :, :]�   /   1          		return final_array5��                        �                     �                         '                    �                        (                    �                        )                    �                        *                    �                        +                    �                        ,                    �                        -                    �                        .                    �                        /                    �       	                 0                    �       
                 1                    �                        2                    �    	                     [                    �    	                    \                    �    
                     a                    �    
                    b                    �                         �                    �                        �                    �                         �                    �                        �                    �                         �                    �                        �                    �                                             �                                            �                                             �                                             �                        !                    �                        "                    �                         @                    �                        A                    �                        B                    �                        C                    �                        D                    �                        E                    �                         d                    �                        e                    �                        f                    �                        g                    �                        h                    �                        i                    �                        j                    �                        k                    �                         �                    �                        �                    �                                            �                         �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �       	                 �                    �       
                 �                    �                        �                    �                        �                    �                         �                    �                        �                    �                         �                    �                        �                    �                         �                    �                        �                    �                                              �                                            �                          5                    �                         6                    �    "                     p                    �    "                    q                    �    %                    �                    �    '                     ]                    �    '                    ^                    �    '                    _                    �    '                    `                    �    '                    a                    �    '                    b                    �    '                    c                    �    '                    d                    �    '                    e                    �    '   	                 f                    �    '   
                 g                    �    '                    h                    �    '                    i                    �    (                     �                    �    (                    �                    �    )                     �                    �    )                    �                    �    *                     �                    �    *                    �                    �    +                     �                    �    +                    �                    �    -                                         �    -                    	                    �    /                     7                    �    /                    8                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `���     �         0      			for ii in range(b.shape[0]):5��                        "                    �                         "                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `���     �         0      !				for iii in range(a.shape[1]):5��                        D                    �                        C                    �                         C                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `���     �         0      4						final_array[i,ii,iii] = a[i][iii] - b[ii][iii]5��                        h                    �                        g                    �                         g                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `���     �         0      3					final_array[i,ii,iii] = a[i][iii] - b[ii][iii]5��                        f                    �                         f                     5�_�                     	        ����                                                                                                                                                                                                                                                                                                                            	                    V        `���     �         0      �                                                                                             a,np.ndarray[np.float64_t, ndim=2] b):               """   >            Function to implement the most time cossuming line               """   W            final_array = np.zeros([a.shape[0],a.shape[0],a.shape[1]], dtype = a.dtype)                   cdef int i, ii, iii   '            for i in range(a.shape[0]):   0                    for ii in range(b.shape[0]):   9                            for iii in range(a.shape[1]):   R                                    final_array[i,ii,iii] = a[i][iii] - b[ii][iii]                   return final_array5��                      ]   '             ]       �    	                     �                    �    
                     �                    �                         �                    �                         
                    �                         c                    �                         �                    �                         �                    �                         �                    �                      $                $       �                         j                    5��