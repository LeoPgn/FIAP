package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.model.base.BaseEntity;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="genre")
public class Genre extends BaseEntity {

    @Column(name = "genre_name")
    private String name;

    @OneToMany(mappedBy = "genre", orphanRemoval = true)
    private List<GenreTrack> genreTrack;
}