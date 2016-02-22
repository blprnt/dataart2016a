#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofDisableAntiAliasing();
    ofSetVerticalSync(true);
    ofBackgroundHex(0x102040);
    ofSetLogLevel(OF_LOG_NOTICE);
    
    int platformHeight = ofGetHeight()/2;
    int platformDepth = 30;
    int lipDepth = 80;
    int floorHeight = 10;
    int platformWidth = ofGetWidth()/4;
    
    groundLine.addVertex(0, ofGetHeight());
    groundLine.addVertex(0, ofGetHeight()-platformHeight);
    
    groundLine.addVertex(platformWidth, ofGetHeight()-platformHeight);
    groundLine.addVertex(platformWidth, ofGetHeight()-platformHeight+platformDepth);
    groundLine.addVertex(platformWidth-lipDepth, ofGetHeight()-platformHeight+platformDepth);
    groundLine.addVertex(platformWidth-lipDepth, ofGetHeight()-floorHeight);
    
    groundLine.addVertex(ofGetWidth()-platformWidth+lipDepth, ofGetHeight()-floorHeight);
    groundLine.addVertex(ofGetWidth()-platformWidth+lipDepth, ofGetHeight()-platformHeight+platformDepth);
    groundLine.addVertex(ofGetWidth()-platformWidth, ofGetHeight()-platformHeight+platformDepth);
    groundLine.addVertex(ofGetWidth()-platformWidth, ofGetHeight()-platformHeight);
    groundLine.addVertex(ofGetWidth(), ofGetHeight()-platformHeight);
    groundLine.addVertex(ofGetWidth(), ofGetHeight());
    
    box2d.init();
    box2d.setGravity(0, 10);
    box2d.createBounds();
    box2d.setFPS(60.0);
    box2d.registerGrabbing();
    
    ground.addVertexes(groundLine);
    ground.create(box2d.getWorld());
    
    std::string file = "lostitems.json";
    
    // Now parse the JSON
    bool parsingSuccessful = result.open(file);
    
    if (parsingSuccessful)
    {
        Json::Value& categories = result["Category"];
        
        for(int i =0;i<categories.size();i++){
            float randCat = ofRandom(32,230);
            Json::Value& SubCategories  = categories[i]["SubCategory"];
             for(int j =0;j<SubCategories.size();j++){
                 float randSub = ofRandom(i-2,i+2);
                 randSub = ofMap(randSub, 0, categories.size(), 32,230);
                 
                 float startWidth = ofGetWidth()/SubCategories.size()*(j+1);
                 startWidth = ofMap(startWidth, 0, ofGetWidth(), 300, ofGetWidth()-300);
                 
                 float startHeight = (ofGetHeight()/categories.size()*(i+1));
                 startHeight = ofMap(startHeight,0,ofGetHeight(),50,ofGetHeight()-100);
                 
                 ofColor catColor(randCat,randSub,(randSub+randCat)/2);
                 
                 int numItems = std::stoi(SubCategories[j]["count"].asString());
                 for(int k = 0;k<numItems/100;k++){
                     circles.push_back(shared_ptr<ofxBox2dCircle>(new ofxBox2dCircle));
                     circles.back().get()->setPhysics(3.0, 0.53, 0.1);
                     circles.back().get()->setup(box2d.getWorld(), ofRandom(startWidth-50,startWidth+50), ofRandom(startHeight,startHeight+50), 5, catColor);
                 }
             }
        }
    }
    else
    {
        ofLogError("ofApp::setup")  << "Failed to parse JSON" << endl;
    }
    
    
}

//--------------------------------------------------------------
void ofApp::update(){
    
    box2d.update();	
}

//--------------------------------------------------------------
void ofApp::draw(){
    for(int i=0; i<circles.size(); i++) {
        circles[i].get()->draw();
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
