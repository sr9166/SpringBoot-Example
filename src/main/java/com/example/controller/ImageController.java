package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.Image;
import com.example.repository.ImageRepository;

@RestController
@RequestMapping("/image")
public class ImageController {

	@Autowired
	ImageRepository imageRepository;
	
	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public void create(@RequestBody Image image) {
		imageRepository.save(image);
	}
	
	@RequestMapping(value = "{id}")
	public Image read(@PathVariable String id) {
		return imageRepository.findOne(id);
	}
	
	@RequestMapping(method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public void update(@RequestBody Image image) {
		imageRepository.save(image);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void delete(@PathVariable String id) {
		imageRepository.delete(id);
	}
}
