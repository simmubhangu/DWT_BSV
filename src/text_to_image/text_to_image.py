import numpy as np
import cv2
import sys

version_check =[0,0]   
#image_path = 'hh.txt'

image_h = 128 
image_w =128
img = np.zeros((128,128),dtype=np.uint8)
# print img
def check(image_path):
	i =0
	j =0
	p =0
	while True:
		with open(image_path) as f:  
			textfile = f.readlines()             
		for pixel_value in textfile:                     
			if (i != image_h):
				if(j != image_w-1):
					img[i][j] = pixel_value
					j = j+1
				else:
					img[i][j] = pixel_value
					j=0
					i= i+1
		print type(img[0][0])
		cv2.imshow("ll",img)
		if cv2.waitKey(1) & 0xff == ord('q'):
			break

  
if __name__ == '__main__':

    check(sys.argv[1])
    cv2.destroyAllWindows()
 
