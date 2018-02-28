private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0.4;  
public void setup() 
{   
	size(660,510);    
	//noLoop(); 
} 

public void draw() 
{   
	background(0);   
	stroke(112,128,144,40);   
	strokeWeight(4);
	line(330,500,330,400);   
	
	drawBranches(330,400,100,3*(Math.PI)/2);

	fractionLength+=0.00015;
  	branchAngle+=.0001;
  	if (branchAngle >= 0.409)
  		{
  			fractionLength-=0.00019;
			branchAngle-=.00001;
		}
}

  		
	
public void mousePressed()
{
	// if (branchAngle <= 0.403 )
	// {
	// 	fractionLength+=0.0035;
 //  		branchAngle+=.001;
 //  		redraw();
	// }
	// else
	// {
	// 	fractionLength-=0.0035;
	// 	branchAngle-=.001;
	// 	redraw();
	// }
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(x + branchLength*(Math.cos(angle1)));
	int endY1 = (int)(y + branchLength*(Math.sin(angle1)));
	int endX2 = (int)(x + branchLength*(Math.cos(angle2)));
	int endY2 = (int)(y + branchLength*(Math.sin(angle2)));
	
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	
	if (branchLength > smallestBranch) 
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
	
