package org.example.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "purchase")
public class Purchase {
    @Id
    @ManyToOne
    @JoinColumn(name = "email")
    private Customer customer;

    @Id
    @ManyToOne
    @JoinColumn(name = "track_ID")
    private Track track;

    private String payment_method;

    private Date data;

    private String tempo;
}