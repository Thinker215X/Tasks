package com.yh.util;

import java.awt.Point;
import java.util.ArrayList;
import java.util.List;

public class MyJudge {
	List<Point> include;
	
	public MyJudge(int x1, int y1, int x2, int y2) {
		include = new ArrayList<Point>();
		if (x1 > x2) {
			x1 = x1 ^ x2;
			x2 = x1 ^ x2;
			x1 = x1 ^ x2;
			
			y1 = y1 ^ y2;
			y2 = y1 ^ y2;
			y1 = y1 ^ y2;
		}
		
		
		for (int i = x1-1; i < x2; i++) {
			for (int j = y1-1; j < y2; j++) {
				include.add(new Point(i, j));
			}
		}
	}
	public MyJudge() {}
	
	//判断给定的点是否在 include 里
	public boolean judge(int x, int y) {
		Point point = new Point(x, y);
		for(Point p : include) {
			if (p.equals(point)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean isFirst(int x, int y) {
		if (new Point(x, y).equals(include.get(0))) {
			return true;
		}
		return false;
	}
}
