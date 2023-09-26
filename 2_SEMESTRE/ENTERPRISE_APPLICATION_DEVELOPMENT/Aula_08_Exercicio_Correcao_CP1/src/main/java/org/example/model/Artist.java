package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "artist")
public class Artist {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "artist_ID", nullable = false)
    private long id;
    @Column(name = "artist_name")
    private String name;
    @Column(name = "artist_type")
    private String type;

    @OneToMany(mappedBy = "Artists",fetch = FetchType.LAZY)
    @ToString.Exclude
    private List<Track> tracks;

    @ManyToMany
    @JoinTable()
    public List<Track> collaborations = new ArrayList<Track>();

    @ManyToMany(mappedBy = "featuringArtists")
    private List<Track> featuredTrack;
}