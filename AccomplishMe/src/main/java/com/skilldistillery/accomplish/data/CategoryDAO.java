package com.skilldistillery.accomplish.data;

import com.skilldistillery.accomplish.entities.Category;

public interface CategoryDAO {
	
	Category findByName(String name);

}
