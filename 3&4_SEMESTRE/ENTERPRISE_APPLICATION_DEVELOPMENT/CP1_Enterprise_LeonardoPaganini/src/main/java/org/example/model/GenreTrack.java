package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "genreTrack")
public class GenreTrack {
    @Id
    @ManyToOne
    @JoinColumn(name = "genre_ID")
    private Genre genre;

    @Id
    @ManyToOne
    @JoinColumn(name = "track_id")
    private Track track;

}
