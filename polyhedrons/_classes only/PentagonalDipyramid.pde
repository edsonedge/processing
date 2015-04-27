/*
PentagonalDipyramid class

david cool
http://davidcool.com
http://generactive.net
http://mystic.codes
*/

public class PentagonalDipyramid extends Polyhedron {
  
  // polyhedron
  final int FACES = 10;     // number of faces 
  final int VERTICES = 3;   // VERTICES per face
  final float C0 = 0.3249196962329063261558714122151;  //sqrt(5 * (5 - 2 * sqrt(5))) / 5
  final float C1 = 0.618033988749894848204586834366;   //(sqrt(5) - 1) / 2
  final float C2 = 0.850650808352039932181540497063;   //sqrt(10 * (5 + sqrt(5))) / 10
  final float C3 = 1.05146222423826721205133816970;    //sqrt(10 * (5 - sqrt(5))) / 5
  final float C4 = 1.447213595499957939281834733746;   //(5 + sqrt(5)) / 5
  private PVector[] vert = new PVector[7]; // list of ve//rtices
  private int[][] faces =  new int[FACES][VERTICES];  // list of faces (joining vertices)
  
  private PentagonalDipyramid() {   
    // set vertices
    vert[  0] = new PVector(  0.0, 0.0,  C4 );
    vert[  1] = new PVector(  0.0, 0.0, -C4 );
    vert[  2] = new PVector(  1.0, -C0, 0.0 );
    vert[  3] = new PVector( -1.0, -C0, 0.0 );
    vert[  4] = new PVector(   C1,  C2, 0.0 );
    vert[  5] = new PVector(  -C1,  C2, 0.0 );
    vert[  6] = new PVector(  0.0, -C3, 0.0 );
    // set faces
    faces[ 0] = new int[] { 0, 2, 4 };
    faces[ 1] = new int[] { 0, 4, 5 };
    faces[ 2] = new int[] { 0, 5, 3 };
    faces[ 3] = new int[] { 0, 3, 6 };
    faces[ 4] = new int[] { 0, 6, 2 };
    faces[ 5] = new int[] { 1, 2, 6 };
    faces[ 6] = new int[] { 1, 6, 3 };
    faces[ 7] = new int[] { 1, 3, 5 };
    faces[ 8] = new int[] { 1, 5, 4 };
    faces[ 9] = new int[] { 1, 4, 2 };
  } //end PentagonalDipyramid()

  public String name() {
    return "Pentagonal Dipyramid";
  }

  public void render() {  
    if (nofill) {
      noFill();
    } else {
      fill(fc0, fc1, fc2, fc3);
    }
        
    if (nostroke) {
      noStroke();
    } else {
      stroke(sc0, sc1, sc2, sc3);
    }
    
    if (parentSphere) {
      //Get parent sphere radius
      r = radius + stray;
      //Convert spherical coordinates into Cartesian coordinates
      x = cos(theta) * sin(phi) * r;
      y = sin(theta) * sin(phi) * r;
      z = cos(phi) * r;
    }
    
    pushMatrix();
    translate(x, y, z);
    scale(scaleSize * zoom); 
    strokeWeight(sw);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    for (int i = 0; i < FACES; i = i+1) {
      beginShape();
      for (int i2 = 0; i2 < VERTICES; i2 = i2+1) {
        vertex(vert[faces[i][i2]].x,vert[faces[i][i2]].y,vert[faces[i][i2]].z);
      } // end for
      endShape(CLOSE);
    } // end for 
    popMatrix();
  } //end render()
   
} //end class PentagonalDipyramid
