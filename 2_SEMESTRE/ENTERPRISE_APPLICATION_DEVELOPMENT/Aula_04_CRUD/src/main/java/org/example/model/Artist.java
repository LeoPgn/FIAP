package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.model.base.BaseEntity;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "artist")
public class Artist extends BaseEntity {

    @Column(name = "artist_name")
    private String name;
    @Column(name = "artist_type")
    private String type;

    @OneToMany(mappedBy = "artist", orphanRemoval = true)
    private List<TrackArtist> trackArtist;

    @OneToMany(mappedBy = "artist", orphanRemoval = true)
    private List<Album> album;
}