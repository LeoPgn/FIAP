package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "artist")
public class Artist {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "artist_id", nullable = false)
    private long id;
    @Column(name = "artist_name")
    private String name;
    @Column(name = "artist_type")
    private String type;

    @OneToMany(mappedBy = "artist", orphanRemoval = true)
    private List<TrackArtist> trackArtist;

    @OneToMany(mappedBy = "artist", orphanRemoval = true)
    private List<Album> album;
}