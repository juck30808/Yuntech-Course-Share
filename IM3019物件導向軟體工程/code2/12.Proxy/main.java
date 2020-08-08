interface Image{
	void display();
}
class ProxyImage implements Image{
	private RealImage realImage;
	private String fileName;
	public ProxyImage(String fileName){
		this.fileName = fileName;
	}
	public void display(){
		if(realImage == null){
			realImage = new RealImage(fileName);
		}
		realImage.display();
	}
}
class RealImage implements Image{
	private String fileName;
	public RealImage(String fileName){
		this.fileName = fileName;
		loadFromDisk(fileName);
	}
	public void display(){
		System.out.println("Displaying " + fileName);}

	private void loadFromDisk(String fileName){
		System.out.println("Loading " + fileName);}
}

public class main{
	public static void main(String[] args) {
		Image image = new ProxyImage("test.jpg");
		image.display();
	}
}

