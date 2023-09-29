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

@Table(name="Record_Label")
public class RecordLabel extends BaseEntity {

    private String record_label_name;
    private String website;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "album_id")
    private List<Album> album;
}
