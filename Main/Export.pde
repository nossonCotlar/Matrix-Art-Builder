void exportMatrix(Mtx m) {
  int sizeX = m.getSizeX();
  int sizeY = m.getSizeY();
  PrintWriter output = createWriter("frame.txt");

  output.println("#" + sizeX + " " + sizeY);

  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      
      Dot temp = m.getDotAt(i, j);
      output.print(i + "-" + j + " ");
      output.print("H" + int(hue(temp.fillCol)));
      output.print("S" + int(saturation(temp.fillCol)));
      output.print("B" + int(brightness(temp.fillCol)) + " ");
    }
    output.print('\n');
  }
  output.close();
}
