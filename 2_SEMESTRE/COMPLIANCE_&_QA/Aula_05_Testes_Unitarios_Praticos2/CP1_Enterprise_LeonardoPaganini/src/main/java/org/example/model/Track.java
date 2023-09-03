package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="track")

public class Track {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "track_ID", nullable = false)
    private Long id;
    @Column(name = "track_name")
    private String name;
    @Column(name = "track_length")
    private double length;
    @Column(name = "track_size")
    private double size;
    @Column(name = "track_price")
    private double price;
    @Column(name = "track_language")
    private String language;
    @Column(name = "track_producer")
    private String producer;
    @Column(name = "track_songwriters")
    private String songwriters;
    @Column(name = "track_released")
    private String released;

    @OneToMany(mappedBy = "track", orphanRemoval = true)
    private List<TrackArtist> trackArtist;

    @OneToMany(mappedBy = "track", orphanRemoval = true)
    private List<AlbumTrack> albumTrack;

    @OneToMany(mappedBy = "track", orphanRemoval = true)
    private List<GenreTrack> genreTrack;
}