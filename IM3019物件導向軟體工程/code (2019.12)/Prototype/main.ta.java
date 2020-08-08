class Color {
	public String rgb;
	public Color() {
		rgb = "#000000";
	}
	public String getRGB() {
		return rgb;
	}
	public void setRGB(String rgb) {
		this.rgb = rgb;
	}
}

class DeepSquare implements Cloneable {
	public int height;
	public Shadow shadow;
	
	public DeepSquare(int height) {
		this.height = height;
		this.shadow = new Shadow();
	}
	public int getHeight() {
		return this.height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public Shadow getShadow() {
		return this.shadow;
	}
	public Object clone() {
		Object clone = null;
		try {
			clone = super.clone();
			((DeepSquare) clone).shadow = (Shadow) this.shadow.clone();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return clone;
	}
}

class ShallowSquare implements Cloneable {
	public int height;
	public Color color;
	
	public ShallowSquare(int height) {
		this.height = height;
		this.color = new Color();
	}
	public int getHeight() {
		return this.height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public Color getColor() {
		return color;
	}
	public Object clone() {
		Object clone = null;
		
		try {
			clone = super.clone();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return clone;
	}
}

class Shadow implements Cloneable {
	public int shadowHeight;
	
	public Shadow() {
		this.shadowHeight = 1;
	}
	public int getHeight() {
		return this.shadowHeight;
	}
	public void setHeight(int shadowHeight) {
		this.shadowHeight = shadowHeight;
	}
	public Object clone() {
		Object clone = null;
		
		try {
			clone = super.clone();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return clone;
	}
}

public class PrototypeDemo {
	public static void main(String[] args) {
		ShallowSquare shallow = new ShallowSquare(10);
		Color c = shallow.getColor();
		ShallowSquare shallow2 = (ShallowSquare) shallow.clone();
		Color c2 = shallow2.getColor();
		
		System.out.println("=====Shallow Clone Test=====");
		System.out.println("原型Square長度和顏色：" + shallow.getHeight() + ", " + c.getRGB());
		System.out.println("克隆Square長度和顏色：" + shallow2.getHeight() + ", " + c2.getRGB());
		
		c2.setRGB("#FFFFFF");
		System.out.println("=====設定克隆的關係Color為[#FFFFFF]=====");
		System.out.println("原型Square長度和顏色：" + shallow.getHeight() + ", " + c.getRGB());
		System.out.println("克隆Square長度和顏色：" + shallow2.getHeight() + ", " + c2.getRGB());
		
		System.out.println("");
		
		DeepSquare deep = new DeepSquare(10);
		Shadow s = deep.getShadow();
		DeepSquare deep2 = (DeepSquare) deep.clone();
		Shadow s2 = deep2.getShadow();
		
		System.out.println("=====Deep Clone Test=====");
		System.out.println("原型Square長度和陰影：" + deep.getHeight() + ", " + s.getHeight());
		System.out.println("克隆Square長度和陰影：" + deep2.getHeight() + ", " + s2.getHeight());
		
		s2.setHeight(5);
		System.out.println("=====設定克隆的關係Shadow長度為[5]=====");
		System.out.println("原型Square長度和陰影：" + deep.getHeight() + ", " + s.getHeight());
		System.out.println("克隆Square長度和陰影：" + deep2.getHeight() + ", " + s2.getHeight());
	}
}
