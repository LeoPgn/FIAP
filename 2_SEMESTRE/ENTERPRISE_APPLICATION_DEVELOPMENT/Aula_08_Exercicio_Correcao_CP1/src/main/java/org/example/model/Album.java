package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="album")
public class Album {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "album_ID", nullable = false)
    private Long id;
    @Column(name = "album_name")
    private String name;
    @Column(name = "album_type")
    private String type;
    @Column(name = "album_released")
    private Date released;
    @Column(name = "album_recorded")
    private String recorded;

    @ManyToOne
    @JoinColumn(name = "artist_ID")
    private Artist artist;

    @ManyToOne
    @JoinColumn(name = "record_label_ID")
    private RecordLabel recordLabel;
}