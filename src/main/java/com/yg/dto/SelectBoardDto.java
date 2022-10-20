package com.yg.dto;

public class SelectBoardDto {
	private int document_id;
	private String title;
	private String content;
	private int writer_id;
	private String name;
	private String creation_Date;
	private int hits;
	public SelectBoardDto() {}
	public SelectBoardDto(int document_id, String title, String content, int writer_id, String name,
			String creation_Date, int hits) {
		super();
		this.document_id = document_id;
		this.title = title;
		this.content = content;
		this.writer_id = writer_id;
		this.name = name;
		this.creation_Date = creation_Date;
		this.hits = hits;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreation_Date() {
		return creation_Date;
	}
	public void setCreation_Date(String creation_Date) {
		this.creation_Date = creation_Date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
}
