package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Image;

public interface ImageRepository extends MongoRepository<Image, String> {

	public Image findOneByName(String name);
}
