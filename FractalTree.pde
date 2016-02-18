private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0.4; 
private int b = 15; 
public void setup() 
{   
	size(640,480);    
	// noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(161,120,41);   
	strokeWeight(20);
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2,b);
	 //will add later 
} 

public void keyPressed()
{
	if(keyCode == UP)
	{
		branchAngle -= 0.05;
	} else if(keyCode ==  DOWN) {
		branchAngle += 0.05;
	}
}



public void drawBranches(int x,int y, double branchLength, double angle,int thickness) 
{   
	
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);  
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);  
	 int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	// //your code here 
strokeWeight(thickness);
if(thickness > 0.5){
	stroke(161,120,41);
} else {
	stroke(0,255,0);
}
line(x,y,endX1,endY1);
line(x,y,endX2,endY2);
thickness = (int)(thickness*0.75);
if(branchLength > smallestBranch){
		// b = (int)(b*0.75);
		 drawBranches(endX1,endY1,branchLength,angle1,thickness);
		 // b = (int)(b*0.75);
		drawBranches(endX2,endY2,branchLength,angle2,thickness);
		
		 // drawBranches(endX1,endY1,branchLength,(angle1 + angle2)/3,thickness);
		 // drawBranches(endX2,endY2,branchLength,3*(angle1 + angle2)/2,thickness);
		 
	}   
} 
