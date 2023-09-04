package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "albumTrack")
public class AlbumTrack {
    @Id
    @ManyToOne
    @JoinColumn(name = "album_ID")
    private Album album;

    @Id
    @ManyToOne
    @JoinColumn(name = "track_ID")
    private Track track;
}
