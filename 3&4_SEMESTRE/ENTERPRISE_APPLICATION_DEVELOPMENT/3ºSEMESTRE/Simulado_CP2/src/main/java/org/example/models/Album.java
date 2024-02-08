package org.example.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.models.base.BaseEntity;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Album")
public class Album extends BaseEntity {

    @Column(nullable = false)
    private String album_name;
    private String album_type;
    private Date album_released;
    private Date album_recorded;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "artist_id")
    private Artist artist;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "record_label_id")
    private RecordLabel recordLabel;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "album_track",
            joinColumns = @JoinColumn(name = "album_id"),
            inverseJoinColumns = @JoinColumn(name="track_id")
    )
    private List<Track> tracks;

}
