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
@Table(name="genre")
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "genre_ID", nullable = false)
    private Long id;
    @Column(name = "genre_name")
    private String name;

    @OneToMany(mappedBy = "genre", orphanRemoval = true)
    private List<GenreTrack> genreTrack;
}