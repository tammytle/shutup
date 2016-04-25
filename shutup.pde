
/*
Copyright (C) 2014  Thomas Sanchez Lengeling.
 KinectPV2, Kinect for Windows v2 library for processing
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

FaceData [] faces;
HDFaceData  [] hdFaces;

void setup() {
  size(1920, 1080, P3D);

  kinect = new KinectPV2(this);
  kinect.enableFaceDetection(true);
  kinect.enableHDFaceDetection(true);
  kinect.init();
}

void draw() {
  background(0);
  image(kinect.getColorImage(), 0, 0, width, height);

  faces =  kinect.getFaceData();
  hdFaces =  kinect.getHDFaceVertex();
  
  for(int i = 0; i < faces.length; i++) {
   if(faces[i].isFaceTracked()){
     FaceFeatures[] ff = faces[i].getFaceFeatures();
     PVector[] fv = hdFaces[i].getHDFaceVertex();

     if(ff[KinectPV2.FaceProperty_WearingGlasses].getState() == 1) {
       
     }
     
     if(ff[KinectPV2.FaceProperty_MouthOpen].getState() == 1) {
       PVector leftMouth = fv[KinectPV2.Face_LeftMouth];
       PVector rightMouth = fv[KinectPV2.Face_RightMouth];
       
       strokeWeight(30);
       line(leftMouth.x - 50, leftMouth.y - 25 , rightMouth.x + 50 , rightMouth.y - 75);
       line(leftMouth.x - 50, leftMouth.y - 75 , rightMouth.x + 50 , rightMouth.y - 25);
     }
   } 
  }
}

void keyPressed(){
  if (key == 's'){
    saveFrame("dada-########.jpg");
  }
}



