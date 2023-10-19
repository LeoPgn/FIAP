package org.example.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.models.base.BaseEntity;

import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity

@Table(name="Genre")
public class Genre extends BaseEntity {

    private String genre_name;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "genre_track",
            joinColumns = @JoinColumn(name = "genre_id"),
            inverseJoinColumns = @JoinColumn(name="track_id")
    )
    private List<Track> tracks;
}
