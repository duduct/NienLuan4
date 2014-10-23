package vn.com.nhatro.model;

// default package
// Generated Sep 9, 2014 4:09:16 PM by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.OneToOne;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Toado generated by hbm2java
 */
@Entity
@Table(name = "toado", catalog = "nhatro")
public class Toado implements java.io.Serializable {

	private Integer toadoid;
	private float x;
	private float y;
	private Nhatro nhatro;

	public Toado() {
	}

	public Toado(float x, float y) {
		this.x = x;
		this.y = y;
	}

	public Toado(float x, float y, Nhatro nhatro) {
		this.x = y;
		this.y = y;
		this.nhatro = nhatro;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "TOADOID", unique = true)
	public Integer getToadoid() {
		return this.toadoid;
	}

	public void setToadoid(Integer toadoid) {
		this.toadoid = toadoid;
	}

	@Column(name = "X", nullable = false, precision = 16, scale = 6)
	public float getX() {
		return x;
	}

	public void setX(float x) {
		this.x = x;
	}

	@Column(name = "Y", nullable = false, precision = 16, scale = 6)
	public float getY() {
		return this.y;
	} 

	public void setY(float y) {
		this.y = y;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "toado")
	public Nhatro getNhatro() {
		return this.nhatro;
	}

	public void setNhatro(Nhatro nhatro) {
		this.nhatro = nhatro;
	}

}
