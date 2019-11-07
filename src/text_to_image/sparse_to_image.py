import numpy as np
import cv2
import sys

#image_path = 'hh.txt'

image_h = 128 
image_w =128
img_ll = np.zeros((128,128),dtype=np.uint8)
img_lh = np.zeros((128,128),dtype=np.uint8)
img_hl = np.zeros((128,128),dtype=np.uint8)
img_hh = np.zeros((128,128),dtype=np.uint8)
# print img
def check(image_path):
	while True:
		with open(image_path) as f:  
			textfile = f.readlines()             
		for pixel_value in textfile:
			value = pixel_value.split() 
			print value[0]
			img_lh[int(value[0])][int(value[1])] = value[1]	
		cv2.imshow("DWT _image",img_lh)
		if cv2.waitKey(1) & 0xff == ord('q'):
			break

  
if __name__ == '__main__':

    check(sys.argv[1])
    cv2.destroyAllWindows()
 
