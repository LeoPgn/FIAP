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
@Table(name="record_label")
public class RecordLabel {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "record_label_ID", nullable = false)
    private Long id;
    @Column(name = "record_label_name")
    private String name;
    private String website;
    @OneToMany(mappedBy = "recordLabel", orphanRemoval = true)
    private List<Album> album;
}