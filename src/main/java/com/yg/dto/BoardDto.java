package com.yg.dto;

public class BoardDto {
	private int document_id;
	private String title;
	private String content;
	private int writer_id;
	private String creation_date;
	private int hits;
	public BoardDto() {}
	public BoardDto(String title, String content, int writer_id) {
		super();
		this.title = title;
		this.content = content;
		this.writer_id = writer_id;
	}
	public BoardDto(int document_id, String title, String content) {
		super();
		this.document_id = document_id;
		this.title = title;
		this.content = content;
	}
	public BoardDto(int document_id, String title, String content, int writer_id, String creation_date, int hits) {
		super();
		this.document_id = document_id;
		this.title = title;
		this.content = content;
		this.writer_id = writer_id;
		this.creation_date = creation_date;
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
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
}
