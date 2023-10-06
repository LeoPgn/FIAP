package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "trackArtist")
public class TrackArtist {
    @Id
    @ManyToOne
    @JoinColumn(name = "track_ID")
    private Track track;

    @Id
    @ManyToOne
    @JoinColumn(name = "artist_ID")
    private Artist artist;

    @ManyToOne
    @JoinColumn(name = "featuring_artist_id")
    private Artist featuring_artist_id;
}
