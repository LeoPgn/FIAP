package org.example.models;



import jakarta.persistence.*;
import org.example.enums.PaymentMethodType;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;


//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@Entity

@Table(name="Purchase")
public class Purchase {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "track_id")
    private Track track;

    @Enumerated(EnumType.STRING)
    private PaymentMethodType payment_method;
    private LocalDate data;
    private LocalDate tempo;


}





