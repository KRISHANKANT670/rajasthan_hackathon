import cv2

#img = cv2.imread('lena.png')
cap = cv2.VideoCapture(1)
cap.set(3,640)
cap.set(4,480)

className= []
classfile = 'coco.names'
with open(classfile,'rt') as f:
    className = f.read().rstrip('\n').split('\n')
#print(className)   

configPath = 'ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt'
weightPath = 'frozen_inference_graph.pb'

net = cv2.dnn_DetectionModel(weightPath,configPath)
net.setInputSize(320,320)
net.setInputScale(1.0 / 127.5)
net.setInputMean((127.5, 127.5, 127.5))
net.setInputSwapRB(True)

while cap.isOpened():

    success,img = cap.read()
    classIds, confs, bbox = net.detect(img,confThreshold = 0.5)
    print(classIds)

    if len(classIds) != 0:
        for classId, confidence,box in zip(classIds.flatten(),confs.flatten(),bbox):
            cv2.rectangle(img,box,color=(0,255,0),thickness=2)
            cv2.putText(img,className[classId-1].upper(),(box[0]+10,box[1]+30),
                        cv2.FONT_HERSHEY_COMPLEX,1,(0,255,0),2)
            
            cv2.putText(img,str(round(confidence*100,2)),(box[0]+200,box[1]+30),
                        cv2.FONT_HERSHEY_COMPLEX,1,(0,255,0),2)

    cv2.imshow("output",img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
        



cap.release()
cv2.destroyAllWindows()